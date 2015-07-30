public class GS_Logger {

	private Type classType;

	private static Map<Type, GS_Logger> typeLoggerMap = new Map<Type, GS_Logger>();

	private GS_Logger() {}

	public static GS_Logger create(Type thisClassType) {
		if(typeLoggerMap.containsKey(thisClassType)) {
			return typeLoggerMap.get(thisClassType);
		} else {
			GS_Logger logger = new GS_Logger();
			logger.classType = thisClassType;
			typeLoggerMap.put(thisClassType, logger);
			return logger;
		}
	}

	public void error(Object message, String tag) {
		addMessage(message, LoggingLevel.ERROR, tag);
	}

	public void error(Object message) {
		error(message, null);
	}

	public void debug(Object message, String tag) {
		addMessage(message, LoggingLevel.DEBUG, tag);
	}

	public void debug(Object message) {
		debug(message, null);
	}

	public void info(Object message, String tag) {
		addMessage(message, LoggingLevel.INFO, tag);
	}

	public void info(Object message) {
		info(message, null);
	}

	private void addMessage(String messageText, LoggingLevel loggingLevel, String tag) {
		String formatedMessage = '[ Class: {0} ] [ {1} ] [ {2} ]';
		String[] params = new String[] {classType.getName(), tag, messageText};
		System.debug(loggingLevel, String.format(formatedMessage, params));
	}

	private void addMessage(Object objectsForDisplay, LoggingLevel loggingLevel, String tag) {
		addMessage(JSON.serialize(objectsForDisplay), loggingLevel, tag);
	}

	private void addMessage(Object[] objectsForDisplay, LoggingLevel loggingLevel, String tag) {
		addMessage(JSON.serialize(objectsForDisplay), loggingLevel, tag);
	}
}