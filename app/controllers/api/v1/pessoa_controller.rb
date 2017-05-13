class Api::V1::PessoaController < Api::V1::ApplicationController
  before_action :set_pessoa, only: [:show, :edit, :update, :destroy]

 def index
   @pessoas = Pessoa.all
 end

 def show
 end

 def create
    @pessoa = Pessoa.new(nota_params)
    if @pessoa.save
      render :json => {msg: "Cadastrado com sucesso!", erro: false}
    else
      render :json => @pessoa.errors
    end
 end

 def update
     if @pessoa.update(nota_params)
       render :json => @pessoa
     else
       render :json => @pessoa.errors
     end
 end

 def destroy
   @pessoa.destroy
   respond_to do |format|
     format.html { redirect_to cidades_url, notice: 'Cidade was successfully destroyed.' }
     format.json { head :no_content }
   end
 end

 private

  def set_pessoa
     @pessoa = Pessoa.find(params[:id])
  end

  def nota_params
    params.require(:pessoa).permit(:nome, :endereco, :date_nascimento)
  end

 end
