## Novos métodos para a classe DateTime

Para manter a compatibilidade (duck-typing) com a classe **Time**, três métodos novos foram adicionados à classe **DateTime**. Os métodos são **#utc**, **#utc?** e **#utc\_offset**. Vamos ver um exemplo de uso de cada um:

	>> date = DateTime.civil(2005, 2, 21, 10, 11, 12, Rational(-6, 24))
	#=> Mon, 21 Feb 2005 10:11:12 -0600

	>> date.utc
	#=> Mon, 21 Feb 2005 16:11:12 +0000

	>> DateTime.civil(2005, 2, 21, 10, 11, 12, Rational(-6, 24)).utc?
	#=> false

	>> DateTime.civil(2005, 2, 21, 10, 11, 12, 0).utc?
	#=> true

	>> DateTime.civil(2005, 2, 21, 10, 11, 12, Rational(-6, 24)).utc_offset
	#=> -21600
