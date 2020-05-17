<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class ResetPasswordMail extends Mailable
{
    use Queueable, SerializesModels;

    public $forgotContentValue;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($forgotContentValue)
    {
        $this->forgotContentValue = $forgotContentValue;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Reset password')->markdown('emails.resetPassword');
    }
}