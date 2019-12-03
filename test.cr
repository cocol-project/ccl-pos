require "openssl"
require "big"

sha = OpenSSL::Digest.new("SHA256")

(1..100).each do |_|
  sha.update("we don't need no education #{Random.rand}")
  h = sha.hexdigest
  hb = h.to_big_i(16)
  t = hb % 10

  pp t
end
