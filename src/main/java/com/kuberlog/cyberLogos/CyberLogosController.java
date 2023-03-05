package com.kuberlog.cyberLogos;

import javafx.fxml.FXML;
import javafx.scene.control.Label;

public class CyberLogosController {
    @FXML
    private Label welcomeText;

    @FXML
    protected void onHelloButtonClick() {
        welcomeText.setText("CyberLogos: v0.1");
    }
}