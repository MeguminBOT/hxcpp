import LocalFunctionExceptions.Status;

class ToStringExceptions {
	static function thrower():Dynamic {
		return Common.makeThrowingToString();
	}

	public static function testConcat():Status {
		try {
			final s = "" + thrower();

			return Error('No exception caught, got $s');
		} catch (e:Dynamic) {
			if (Std.string(e) == 'boom toString') {
				return Ok;
			}

			return Error('Incorrect exception caught: ' + Std.string(e));
		}
	}

	public static function testConversion():Status {
		try {
			final s:String = thrower();

			return Error('No exception caught, got $s');
		} catch (e:Dynamic) {
			if (Std.string(e) == 'boom toString') {
				return Ok;
			}

			return Error('Incorrect exception caught: ' + Std.string(e));
		}
	}
}
