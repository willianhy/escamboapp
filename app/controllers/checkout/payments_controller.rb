class Checkout::PaymentsController < ApplicationController
	def create
		# Email: c18626079304686254910@sandbox.pagseguro.com.br
		# Senha: CLC8t6uyCkhkjuXR
		# Cartão de Crédito: 4111111111111111 / Bandeira: visa Válido até: 12/2030 CVV: 123

		ad = Ad.find(params[:ad_id])
		ad.processing!

		order = Order.create(ad: ad, buyer_id: current_member.id)
		order.waiting!

		render text: "Processando... Pedido: #{order.status_i18n} - Anúncio: #{ad.status_i18n}"
	end
end
