package service.exception;


public class AppointFailedException extends ServiceException {
    public AppointFailedException() {
        super();
    }

    public AppointFailedException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }

    public AppointFailedException(String message, Throwable cause) {
        super(message, cause);
    }

    public AppointFailedException(String message) {
        super(message);
    }

    public AppointFailedException(Throwable cause) {
        super(cause);
    }
}
