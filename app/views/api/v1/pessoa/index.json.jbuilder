json.array!(@pessoas) do |i|
  json.id i.id
  json.nome i.nome
  json.endereco i.endereco
  json.data_nascimento
end
