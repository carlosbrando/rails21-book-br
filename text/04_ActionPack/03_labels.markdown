## Rótulos

Ao criar um novo formulário usando **scaffold** ele será criado com o seguinte código:

	<% form_for(@post) do |f| %>
	  <p>
	    <%= f.label :title %><br />
	    <%= f.text_field :title %>
	  </p>
	  <p>
	    <%= f.label :body %><br />
	    <%= f.text_area :body %>
	  </p>
	  <p>
	    <%= f.submit "Update" %>
	  </p>
	<% end %>

Desta forma faz muito mais sentido. O método **label** foi incluído. Este método retorna uma *string* com o título da coluna dentro de uma tag HTML **\<label\>**.

	>> f.label :title
	=> <label for="post_title">Title</label>

	>> f.label :title, "A short title"
	=> <label for="post_title">A short title</label>

	>> label :title, "A short title", :class => "title_label"
	=> <label for="post_title" class="title_label">A short title</label>

Percebeu o parâmetro **for** dentro da tag? O "post\_title" é o nome da caixa de texto que contém o título do nosso post. A tag **\<label\>** é na verdade um rótulo associado ao objeto **post\_title**. Quando se clica no rótulo (ele não é um link) o controle associado à ele recebe o foco.

Robby Russell escreveu um artigo interessante em seu blog sobre este assunto. Você pode lê-lo no endereço: [http://www.robbyonrails.com/articles/2007/12/02/that-checkbox-needs-a-label](http://www.robbyonrails.com/articles/2007/12/02/that-checkbox-needs-a-label)

Também foi incluído o método **label\_tag** no **FormTagHelper**. Este método funciona exatamente como o label mas de uma forma mais simplista:

	>> label_tag 'nome'
	=> <label for="nome">Nome</label> 

	>> label_tag 'nome', 'Seu nome'
	=> <label for="nome">Seu Name</label> 

	>> label_tag 'nome', nil, :class => 'small_label'
	=> <label for="nome" class="small_label">Nome</label>

O método também aceita a opção **:for**, veja um exemplo:

	label(:post, :title, nil, :for => "my_for")

Isto vai retornar algo assim:

	<label for="my_for">Title</label>
