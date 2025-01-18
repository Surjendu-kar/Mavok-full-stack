'use client';

import { formatPrice, getLowestPrice } from '@/utils';
import { useState } from 'react';
import AddToCart from '@/components/product-details/add-to-cart';
import VariantsSelector from '@/components/product-details/variants-selector';

type Props = {
  productId: string;
  product: Accessories;
};

export default function PriceSection({ productId, product }: Props) {
  const lowestPrice = getLowestPrice(product);
  const [selectedPrice, setSelectedPrice] = useState(lowestPrice);

  const handlePriceChange = (newPrice: number) => {
    setSelectedPrice(newPrice);
  }; 

  const selectedProduct = {
    ...product,
    price: selectedPrice,
  }

  return (
    <>
      <VariantsSelector
        productId={productId}
        onPriceChange={handlePriceChange}
        defaultPrice={lowestPrice}
        product={product}
      />

      <div className="flex flex-col justify-center gap-2 lg:gap-4 bg-primary-lighter w-[350px] lg:w-[500px] rounded-md p-3 lg:p-5">
        {/* price */}
        <p className="text-xl lg:text-3xl font-bold uppercase">
          ${formatPrice(lowestPrice)} AUD
        </p>

        {/* offer */}
        <div className="flex flex-col">
          <div className="flex items-center gap-2">
            <p className="line-through text-primary-light text-sm lg:text-base">
              ${formatPrice(lowestPrice)} AUD
            </p>
            <p className="text-secondary-main font-bold text-sm lg:text-base">
              Save 25% or $111
            </p>
          </div>

          <p className="text-primary-light text-sm lg:text-base">
            or $27.75/month with 36-month financing*, before trade-in
          </p>
        </div>

        <AddToCart product={selectedProduct} />
      </div>
    </>
  );
}
