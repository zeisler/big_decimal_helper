module BigDecimalHelper
  # Defines a conversion protocol for BigDecimal that is
  # (a) easier to type than { BigDecimal(something.to_s) }
  # (b) idempotent (by virtue of being lazy^H^H returning self when called on BigDecimal)
  # (c) restricted to a few known types
  module ConversionProtocol
    module Self
      def to_bd
        self
      end
    end

    module ViaStringRepresentation
      def to_bd
        string_representation = to_s.gsub(/[^\-\d\.]/, '')
        BigDecimal.new(string_representation)
      end
    end
  end
end

BigDecimal.send :include, BigDecimalHelper::ConversionProtocol::Self
Integer   .send :include, BigDecimalHelper::ConversionProtocol::ViaStringRepresentation
Float     .send :include, BigDecimalHelper::ConversionProtocol::ViaStringRepresentation
String    .send :include, BigDecimalHelper::ConversionProtocol::ViaStringRepresentation
NilClass  .send :include, BigDecimalHelper::ConversionProtocol::ViaStringRepresentation
