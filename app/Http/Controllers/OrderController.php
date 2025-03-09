<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function checkout(Request $request)
    {
        // Validate the incoming data
        $data = $request->validate([
            'customer_name' => 'required|string|max:255',
            'customer_address' => 'required|string|max:255',
            'customer_phone' => 'required|string|max:15',
            'items' => 'required|array', // Cart items as an array
            'total_price' => 'required|numeric',
        ]);

        // Create the order
        $order = Order::create([
            'customer_name' => $data['customer_name'],
            'customer_address' => $data['customer_address'],
            'customer_phone' => $data['customer_phone'],
            'items' => json_encode($data['items']), // Store items as JSON
            'total_price' => $data['total_price'],
        ]);

        // Return a success response
        return response()->json(['message' => 'Order placed successfully', 'order' => $order]);
    }
    public function index()
{
    try {
        $orders = Order::all();  // Get all orders without eager loading
        foreach ($orders as $order) {
            // You are manually saving customer data in the Order model
            $order->customer_name; // This should be displayed directly
            $order->customer_address; // Similarly for other customer data
            $order->customer_phone;
        }

        return response()->json($orders);
        
    } catch (\Exception $e) {
        return response()->json(['error' => 'Error fetching orders'], 500);
    }
    
}

}
