@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Admin Dashboard</h1>
    <h2>Products</h2>
    <ul>
        @foreach($products as $product)
            <li>{{ $product->name }} - ${{ $product->price }}</li>
        @endforeach
    </ul>

    <h2>Orders</h2>
    <ul>
        @foreach($orders as $order)
            <li>{{ $order->customer_name }} - ${{ $order->total_price }}</li>
        @endforeach
    </ul>
</div>
@endsection
