<?php
/**
 * Created by PhpStorm.
 * User: srainsdon
 * Date: 3/30/2017
 * Time: 5:52 AM
 */

include_once '../config.php';
session_start();
/* Get Nibble Forms 2 instance called mega_form */
$form = \Nibble\NibbleForms\NibbleForm::getInstance('mega_form');

/* Text field with custom class and max length attribute */
$form->addField('text_field', 'text', array(
    'class' => 'testy classes',
    'max_length' => 20
));

/* Email field, not required and custom label text */
$email = $form->addfield('email', 'email', array(
    'required' => false,
    'label' => 'Please enter your email address'
));
/* Email confirmation field which must match the value for email */
$email->addConfirmation('confirm_email', array(
    'label' => 'Please confirm your email address'
));

/* Radio button field with two options, first option has an additional attribute */
$form->addField('choice', 'radio', array(
    'choices' => array(
        "one" => array('data-example' => 'data-attribute-value', 'Choice One'),
        "two" => "Choice Two"),
    'false_values' => array("two")
));
echo $form->render();
/* If the form is valid, do something */
if ($form->validate()) {
    echo "Form has validated";
}