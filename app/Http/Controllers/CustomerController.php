<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Classes\Mappers\ShoppingCartMapper;
use App\Classes\Mappers\UserMapper;
use App\Classes\Mappers\SaleMapper;
use Auth;
use Redirect;
use Session;

class CustomerController extends Controller {

    private $shoppingCartMapper;
    private $saleMapper;

    public function __construct() {
        $this->middleware('auth');
        $this->middleware('CheckCustomer');

        $this->middleware(function ($request, $next) {
            $this->shoppingCartMapper = new ShoppingCartMapper(auth()->user()->id);
            $this->userCatalogMapper = new UserMapper(auth()->user()->id);
            $this->saleMapper = new SaleMapper(auth()->user()->id);

            Session::put('currentSaleExists', $this->saleMapper->currentSaleExists());
            return $next($request);
        });


        date_default_timezone_set('America/Montreal');
    }

    public function doAddToCart(Request $request) {
        $result = $this->shoppingCartMapper->addToCart($request->input('eSId'), Auth::user()->id, date("Y/m/d H:i:s", strtotime("+5 minutes")));

        if ($result === 'itemAddedToCart') {
            $request->session()->flash('success_msg', 'The item is added to the shopping cart.');
        } else if ($result === 'itemOutOfStock') {
            $request->session()->flash('error_msg', 'Out of stock');
        } else if ($result === 'shoppingCartFull') {
            $request->session()->flash('error_msg', 'Your shopping cart is full. Could not add the item.');
        }

        return Redirect::back();
    }

    public function doViewCart() {

        $shoppingCart = $this->shoppingCartMapper->viewCart();

        return view('pages.shopping-cart', ['shoppingCart' => $shoppingCart]);
    }

    public function doRemove(Request $request) {
        $message = $this->shoppingCartMapper->removeFromCart($request->input('eSId'), Auth::user()->id);
        $request->session()->flash('success_msg', $message);
        return Redirect::back();
    }

    public function doViewAccount(Request $request) {
        $user = $this->userCatalogMapper->getUserInfo(Auth::user()->id);

        return view('pages.view-customer-info', ['user' => $user]);
    }

    public function doDeleteMyAccount(Request $request) {
        $user = $this->userCatalogMapper->deleteAccount(Auth::user()->id);

        // Return the homepage & log out the user.
        return Redirect::to('logout');
    }

    public function showCheckout() {
        $sale = $this->saleMapper->makeNewSale();

        Session::put('currentSaleExists', $this->saleMapper->currentSaleExists());

        return view('pages.checkout', ['sale' => $sale]);
    }

    public function cancelCheckout() {
        $this->saleMapper->cancelCheckout();

        return Redirect::to('/');
    }

    public function doPayment() {
        $completedSale = $this->saleMapper->makePayment();

        Session::forget('currentSaleExists');

        return view('pages.payment-result', ['sale' => $completedSale]);
    }

}
