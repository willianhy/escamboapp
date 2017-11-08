class Checkout::PaymentsController < ApplicationController
	def create
		# Email: c18626079304686254910@sandbox.pagseguro.com.br
		# Senha: CLC8t6uyCkhkjuXR
		# Cartão de Crédito: 4111111111111111 / Bandeira: visa Válido até: 12/2030 CVV: 123

		ad = Ad.find(params[:ad_id])
		ad.processing!

		order = Order.create(ad: ad, buyer_id: current_member.id)
		order.waiting!

		payment = PagSeguro::PaymentRequest.new

		payment.reference = order.id
    payment.notification_url = root_url #FIX LATER
    payment.redirect_url = site_ad_detail_url(ad)

    payment.items << {
    	id: ad.id,
    	description: ad.title,
    	amount: ad.price.to_s.gsub(',', '.') #12.34
    }

    response = payment.register

		if response.errors.any?
			redirect_to site_ad_detail_path(ad), alert: "Erro ao processar compra… Entre em contato com o SAC (xx) xxx.xxxx"
		else
			redirect_to response.url
		end
	end
end
