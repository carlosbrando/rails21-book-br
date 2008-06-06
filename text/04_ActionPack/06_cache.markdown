## Cache

Todos os métodos **fragment\_cache\_key** agora retornam por padrão o namespace 'view/' como prefixo.

Todos os caching stores foram retirados de **ActionController::Caching::Fragments::*** e agora estão em **ActiveSupport::Cache::***. Neste caso se você faz referência a um store, como **ActionController::Caching::Fragments::MemoryStore**, por exemplo, será necessário alterar sua referência para **ActiveSupport::Cache::MemoryStore**.

**ActionController::Base.fragment\_cache\_store** deixa de existir e dá lugar à **ActionController::Base.cache\_store**.

Foi incluído no **ActiveRecord::Base** o método **cache\_key** para facilitar o armazenamento em cache de Active Records pelas novas bibliotecas **ActiveSupport::Cache::***. Este método funciona assim:

	>> Product.new.cache_key
	=> "products/new"

	>> Product.find(5).cache_key
	=> "products/5"

	>> Person.find(5).cache_key
	=> "people/5-20071224150000"

Foi incluído o **ActiveSupport::Gzip.decompress/compress** para facilitar o wrapper para o **Zlib**.

Agora você pode usar entre as opções de environment o **config.cache\_store** para informar o local padrão de armazenamento do cache. Vale lembrar que se o diretório **tmp/cache** existir o padrão é o **FileStore**, caso contrário o **MemoryStore** é usado. Você pode configurar das seguintes formas:

	config.cache_store = :memory_store
	config.cache_store = :file_store, "/path/to/cache/directory"
	config.cache_store = :drb_store, "druby://localhost:9192"
	config.cache_store = :mem_cache_store, "localhost"
	config.cache_store = MyOwnStore.new("parameter")

Para facilitar as coisas, foi incluído o comentário abaixo no arquivo *environments/production.rb*, afim de lembrá-lo desta opção.

	# Use a different cache store in production
	# config.cache_store = :mem_cache_store
