## Adicionar colunas no PostgreSQL

Havia um bug ao se usar o banco de dados **PostgreSQL**. O bug ocorria quando se criava uma migration para adicionar uma coluna em uma tabela já existente, veja um exemplo:

Arquivo: *db/migrate/002\_add\_cost.rb*

	class AddCost < ActiveRecord::Migration
	  def self.up
	    add_column :items, :cost, :decimal, :precision => 6, 
	   :scale => 2
	  end

	  def self.down
	    remove_column :items, :cost
	  end
	end

Note que estamos criando uma coluna com **:precision => 6** e **:scale => 2**. Agora é hora de rodar o **rake db:migrate** e vamos ver como ficou nossa tabela no banco:

<table border="1" cellspacing="0" cellpadding="5">
	<tr>
		<td><strong>Column</strong></td>
		<td><strong>Type</strong></td>
		<td><strong>Modifiers</strong></td>
	</tr>
	<tr>
		<td>id</td>
		<td>integer</td>
		<td>not null</td>
	</tr>
	<tr>
		<td>descr</td>
		<td>character varying(255)</td>
		<td></td>
	</tr>
	<tr>
		<td>price</td>
		<td>numeric(5,2)</td>
		<td></td>
	</tr>
	<tr>
		<td>cost</td>
		<td>numeric</td>
		<td></td>
	</tr>
</table>

Veja a coluna "cost" que acabamos de criar. Ela é um **numeric** comum, mas deveria ser uma coluna como a "price", logo acima dela, mais precisamente um **numeric(6,2)**. No Rails 2.1 este erro não existe mais, a coluna será criada da forma correta.
