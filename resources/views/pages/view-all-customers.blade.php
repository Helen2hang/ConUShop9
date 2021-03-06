@extends('layouts.default')
@section('content')

<form method="post" action="user">

    <div class="col-lg-9">
        <h2 class="blueTitle text-center">Registered Customers</h2>

        <h3> Accounts </h3>
        <table>
            <tr class="grayBgWhiteText">
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>PhysicalAddress</th>
                <th>Active</th>
            </tr>


            @if (!empty($allCustomers))
            @foreach ($allCustomers as $user)

            <tr bgcolor="#ccebff">
                <td>
                    @if ( isset($user->get()->firstName))
                    {{$user->get()->firstName}}  
                    @endif  
                </td>
                <td>
                    @if ( isset($user->get()->lastName) )
                    {{$user->get()->lastName}}
                    @endif  
                </td>
                <td>
                    @if ( isset($user->get()->email) )
                    {{$user->get()->email}}
                    @endif  
                </td>
                <td>
                    @if ( isset($user->get()->phone) )
                    {{$user->get()->phone}}
                    @endif  
                </td>
                <td>
                    @if ( isset($user->get()->physicalAddress) )
                    {{$user->get()->physicalAddress}}
                    @endif  
                </td>
                <td>
                    @if ( $user->get()->isLoggedIn )
                    Online
                    @else
                    Offline
                    @endif
                </td>

            </tr>
            @endforeach
            @endif
            <input type="hidden" name="_token" value="{{ csrf_token() }}">
        </table>
        <br/>
        <br/>

        <h3> Deleted Accounts </h3>
            @if (!empty($deletedCustomers))
            <table>
            <tr class="grayBgWhiteText">
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>PhysicalAddress</th>
            </tr>
            @foreach ($deletedCustomers as $user)
            <tr bgcolor="#ccebff">
                <td>
                    @if ( isset($user->get()->firstName))
                    {{$user->get()->firstName}}  
                    @endif  
                </td>
                <td>
                    @if ( isset($user->get()->lastName) )
                    {{$user->get()->lastName}}
                    @endif  
                </td>
                <td>
                    @if ( isset($user->get()->email) )
                    {{$user->get()->email}}
                    @endif  
                </td>
                <td>
                    @if ( isset($user->get()->phone) )
                    {{$user->get()->phone}}
                    @endif  
                </td>
                <td>
                    @if ( isset($user->get()->physicalAddress) )
                    {{$user->get()->physicalAddress}}
                    @endif  
                </td>

            </tr>
            @endforeach
            <input type="hidden" name="_token" value="{{ csrf_token() }}">
            </table>
            @else
            <h5>There is no deleted account to show.</h5>
            @endif
            
    </div>

</form>
@stop