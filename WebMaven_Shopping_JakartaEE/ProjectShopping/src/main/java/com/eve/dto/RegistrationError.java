/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.eve.dto;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author PC
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class RegistrationError implements Serializable{
    
    private String usernameLengthError;
    private String passwordLengthError;
    private String confirmNotMatched;
    private String usernameIsExisted;
}
