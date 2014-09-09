module Books
  class API < Grape::API
    format :json
    version 'v1', using: :path

    resource :books do
      desc 'get'
      params do
        requires :id, type: Integer, desc: 'Book ID'
      end
      route_param :id do
        get do
          Book.find(params[:id])
        end
      end
    end
  end
end
