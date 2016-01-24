require 'open-uri'
require 'net/https'
module Net
   class HTTP
      alias_method :original_use_ssl=, :use_ssl=
      def use_ssl=(flag)
         #You may need to use self.ca_path= instead of self.ca_file= depending on your system.
         self.ca_file = Rails.root.join('config/ca-bundle.crt').to_s
         self.verify_mode = OpenSSL::SSL::VERIFY_PEER
         self.original_use_ssl = flag
      end
   end
end
  