package com.ideatown.hikago;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class LoginActivity extends Activity {

    private Button signupButton;
    private TextView signinTV;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        //Get reference to buttons
        signupButton = (Button) findViewById(R.id.signup_button);
        signinTV = (TextView) findViewById(R.id.signin_textview);

        //Handle onClick event for sign-up button
        signupButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //Start new activity
                //TODO: we will bypass this flow, so now we go into list course view
                Intent intent = new Intent(view.getContext(), MainActivity.class);
                startActivity(intent);
            }
        });
    }

}
