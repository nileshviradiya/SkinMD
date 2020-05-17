<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class ForgotPasswordEmail extends Mailable
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
        // echo "<pre>"; print_r($forgotContentValue); die();
        $this->forgotContentValue = $forgotContentValue;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        
        return $this->view('emails.resetPassword');
        
    }
}