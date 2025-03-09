<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    // Define the table name if it's not the plural of the model
    protected $table = 'orders';

    // Specify the columns that are mass assignable
    protected $fillable = [
        'customer_name',
        'customer_address',
        'customer_phone',
        'items', // Cart items stored as JSON
        'total_price',
    ];

    // Cast the 'items' column to an array (for storing and retrieving JSON data)
    protected $casts = [
        'items' => 'array', // Automatically cast the 'items' column to an array
    ];
}
