<?php
// Cart.php (Model)
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    protected $fillable = [
        'cart_id', 'product_name', 'product_price', 'quantity',
    ];
}
