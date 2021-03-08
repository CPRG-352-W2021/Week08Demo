package database;

/**
 * NotesDBException - Passes exception
 */
public class NotesDBException extends Exception {

    /**
     * Sends message from superclass Exception when there is an exception
     * @param message 
     */
    public NotesDBException (String message)
    {
        super(message);
    }
    
    
}
