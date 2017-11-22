<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Classes\Mappers\ShoppingCartMapper;
use App\Classes\Mappers\UserCatalogMapper;

use Auth;
use Redirect;

class CustomerController extends Controller {

    private $shoppingCartMapper;

    public function __construct() {
        $this->middleware('auth');
        $this->middleware('CheckCustomer');

        $this->middleware(function ($request, $next) {
            $this->shoppingCartMapper = new ShoppingCartMapper(auth()->user()->id);
			$this->userCatalogMapper = new UserCatalogMapper(auth()->user()->id);
            return $next($request);
        });


        date_default_timezone_set('America/Montreal');
    }

    public function doAddToCart(Request $request) {
        $result = $this->shoppingCartMapper->addToCart($request->input('eSId'), Auth::user()->id, date("Y/m/d H:i:s", strtotime("+5 minutes")));

        if ($result === 'itemAddedToCart') {
            $request->session()->flash('success_msg', 'The item is added to the shopping cart.');
        } else if($result === 'itemOutOfStock') {
            $request->session()->flash('error_msg', 'Out of stock');
        } else if($result === 'shoppingCartFull'){
            $request->session()->flash('error_msg', 'Your shopping cart is full. Could not add the item.');
        }

        return Redirect::back();
    }

    public function doViewCart() {

        $slis = $this->shoppingCartMapper->viewCart();
        //dd($slis);

        return view('pages.shopping-cart', ['slis' => $slis]);

    }

    public function doRemove(Request $request){
        $message = $this->shoppingCartMapper->removeFromCart($request->input('eSId'), Auth::user()->id);
        $request->session()->flash('success_msg', $message);
        return Redirect::back();
    }

	//Karine
	public function doViewAccount(Request $request){
        $user = $this->userCatalogMapper->getUserInfo(Auth::user()->id);

      return view('pages.view-customer-info', ['user' => $user]);
    }
	
	
	public function doDeleteMyAccount(Request $request){
		$user = $this->userCatalogMapper->deleteAccount(Auth::user()->id);

		// Return the homepage & log out the user.
		return Redirect::to('logout');
	}


}
