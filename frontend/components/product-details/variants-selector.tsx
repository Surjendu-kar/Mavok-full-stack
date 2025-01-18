'use client';

import { useRegion } from '@/context/regionContext';
import { formatPrice } from '@/utils';
import { useState, useEffect } from 'react';
import useCartStore from '@/store/cartStore';
import { FiMinus, FiPlus } from 'react-icons/fi';

type Props = {
  productId: string;
  onPriceChange: (price: number) => void;
  defaultPrice: number;
  product: Accessories;
};

type Variant = {
  id: string;
  title: string;
};

type Product = {
  id: string;
  title: string;
  variants: Variant[];
  calculated_price: {
    calculated_amount: number;
  };
};

export default function VariantsSelector({
  productId,
  defaultPrice,
  product,
}: Props) {
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(true);
  const { region } = useRegion();
  const { addItem, items, decreaseQuantity } = useCartStore();

  useEffect(() => {
    if (!region) return;

    const queryParams = new URLSearchParams({
      handle: productId,
      fields: `*variants.calculated_price`,
      region_id: region?.id || '',
    });

    fetch(`http://localhost:9000/store/products?${queryParams.toString()}`, {
      credentials: 'include',
      headers: {
        'x-publishable-api-key':
          process.env.NEXT_PUBLIC_MEDUSA_PUBLISHABLE_KEY || '',
      },
    })
      .then(res => res.json())
      .then(({ products }) => {
        if (!products.length) return;
        const variants = products[0].variants;
        setProducts(variants);
      })
      .catch(error => console.error('Error fetching products:', error))
      .finally(() => setLoading(false));
  }, [productId, region]);

  const getItemQuantity = (id: string) => {
    const item = items.find(item => item.id.toString() === id.toString());
    return item?.quantity || 0;
  };

  const handleAddToCart = (variant: Product) => {
    addItem({
      ...product,
      price: variant.calculated_price?.calculated_amount || defaultPrice,
      heading: variant.title,
      id: variant.id,
    });
  };

  if (loading) {
    return <div>Loading variants...</div>;
  }

  return (
    <div className="flex flex-col gap-2">
      <h3 className="font-bold text-lg">Options</h3>
      <div className="flex flex-col gap-4">
        {products.map(variant => {
          const quantity = getItemQuantity(variant.id);

          return (
            <div
              key={variant.id}
              className="flex justify-between items-center px-4 py-2 border rounded-md bg-white"
            >
              <div className="flex flex-col">
                <p className="font-bold">{variant.title}</p>
                {variant.calculated_price && (
                  <p className="font-bold">
                    ${formatPrice(variant.calculated_price.calculated_amount)}{' '}
                    AUD
                  </p>
                )}
              </div>
              {quantity === 0 ? (
                <button
                  onClick={() => handleAddToCart(variant)}
                  aria-label={`Add ${variant.title} to cart`}
                  className="bg-primary-main text-white px-4 py-2 rounded hover:bg-primary-main_light transition-colors font-bold"
                >
                  Add to Cart
                </button>
              ) : (
                <div className="flex items-center gap-4">
                  <button
                    onClick={() => decreaseQuantity(variant.id)}
                    className="w-8 h-8 flex items-center justify-center border rounded-md hover:bg-gray-100"
                    aria-label="Decrease quantity"
                  >
                    <FiMinus />
                  </button>
                  <span className="w-8 text-center">{quantity}</span>
                  <button
                    onClick={() => handleAddToCart(variant)}
                    className="w-8 h-8 flex items-center justify-center border rounded-md hover:bg-gray-100"
                    aria-label="Increase quantity"
                  >
                    <FiPlus />
                  </button>
                </div>
              )}
            </div>
          );
        })}
      </div>
    </div>
  );
}
