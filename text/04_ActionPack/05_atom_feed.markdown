## Novos namespaces no Atom Feed

Conhece o método **atom\_feed**? Ele é uma novidade no Rails 2.0, que facilitou muito a criação de feeds Atom. Veja um exemplo de uso:

Em um arquivo *index.atom.builder*:

	atom_feed do |feed|
	  feed.title("Nome do Jogo")
	  feed.updated((@posts.first.created_at))

	  for post in @posts
	    feed.entry(post) do |entry|
	      entry.title(post.title)
	      entry.content(post.body, :type => 'html')

	      entry.author do |author|
	        author.name("Carlos Brando")
	      end
	    end
	  end
	end

O que é um atom feed? Atom é o nome de um estilo baseado em XML e meta data. Em outras palavras é um protocolo quer serve para publicar conteúdo na internet que é sempre atualizado, como um blog, por exemplo. Os feeds sempre são publicados em XML e no caso do Atom Feed ele é identificado como application/atom+xml media type.

Nas primeiras versões do Rails 2.0 este método aceitava como parâmetros as opções **:language**, **:root_url** e **:url**, você pode obter mais informações sobre estes métodos na documentação do Rails. Mas com a alteração realizada, agora podemos incluir novos namespaces ao elemento root do feed. Por exemplo, se fizermos assim:

	atom_feed('xmlns:app' => 'http://www.w3.org/2007/app') do |feed|

Ele retornará isto:

	<feed xml:lang="en-US" xmlns="http://www.w3.org/2005/Atom" 
		xmlns:app="http://www.w3.org/2007/app">

Adaptando o exemplo anterior, poderíamos usá-lo assim:

	atom_feed({'xmlns:app' => 'http://www.w3.org/2007/app',
		'xmlns:openSearch' => 'http://a9.com/-/spec/opensearch/1.1/'}) do |feed| 

	  feed.title("Nome do Jogo")
	  feed.updated((@posts.first.created_at))
	  feed.tag!(openSearch:totalResults, 10) 

	  for post in @posts
	    feed.entry(post) do |entry|
	      entry.title(post.title)
	      entry.content(post.body, :type => 'html')
	      entry.tag!('app:edited', Time.now) 

	      entry.author do |author|
	        author.name("Carlos Brando")
	      end
	    end
	  end
	end
