<?php

namespace App\Models;

use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasFactory, HasApiTokens, Notifiable;

    protected $fillable = [
        'firstName',
        'lastName',
        'gender',
        'email',
        'phone',
        'roles',
        'nfc'
    ];

    protected $hidden = [
        'passwordHash',
        'remember_token'
    ];
}
