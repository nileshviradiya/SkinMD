<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class VerifyMail extends Mailable
{
    use Queueable, SerializesModels;

    public $registerContentValue;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($registerContentValue)
    {
        $this->registerContentValue = $registerContentValue;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Register User')->markdown('emails.verifyUser');
    }
}