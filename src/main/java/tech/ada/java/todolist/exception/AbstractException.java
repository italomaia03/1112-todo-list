package tech.ada.java.todolist.exception;

import org.springframework.http.HttpStatus;

public abstract class AbstractException extends RuntimeException {

    protected AbstractException(String message) {
        super(message);
    }

    public abstract HttpStatus getStatus();

}
