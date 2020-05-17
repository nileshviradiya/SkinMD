<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class AddcaseMail extends Mailable
{
    use Queueable, SerializesModels;

    public $addcase;
    public $subjectMessage;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($addcase)
    {
        $this->addcase = $addcase['content'];
        $this->subjectMessage = $addcase['subject'];
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject($this->subjectMessage)->markdown('emails.AddCase');
    }
}