<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
    // Get cart items
    public function getCartItems(Request $request)
    {
        // Assuming 'cart_id' is used to associate the cart with a user session or identifier
        $cart = Cart::where('cart_id', $request->cart_id)->get();
        return response()->json($cart);
    }

    // Add an item to the cart
    public function addItemToCart(Request $request)
    {
        $cartItem = Cart::create([
            'cart_id' => $request->cart_id,
            'product_name' => $request->product_name,
            'product_price' => $request->product_price,
            'quantity' => $request->quantity,
        ]);

        return response()->json($cartItem);
    }

    // Remove an item from the cart
    public function removeItemFromCart($id)
    {
        $cartItem = Cart::find($id);
        if ($cartItem) {
            $cartItem->delete();
            return response()->json(['message' => 'Item removed successfully']);
        }

        return response()->json(['message' => 'Item not found'], 404);
    }
}
