'use client';

import { useRegion } from '@/context/regionContext';
import { formatPrice } from '@/utils';
import { useState, useEffect } from 'react';

type Props = {
  productId: string;
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

export default function VariantsSelector({ productId }: Props) {
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(true);
  const { region } = useRegion();

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
        setProducts(products[0].variants);
      })
      .catch(error => console.error('Error fetching products:', error));
    setLoading(false);
  }, [productId, region]);

  console.log(products);

  if (loading) {
    return <div>Loading variants...</div>;
  }

  return (
    <div className="flex flex-col gap-2">
      <h3 className="font-bold text-lg">Options</h3>
      <div className="flex flex-col gap-2">
        {products.map(variant => (
          <div
            key={variant.id}
            className="flex justify-between px-4 py-2 border rounded-md hover:bg-primary-lighter"
          >
            <p className="font-bold">{variant.title}</p>
            {variant.calculated_price && (
              <p className="font-bold">
                {formatPrice(variant.calculated_price.calculated_amount)} AUD
              </p>
            )}
          </div>
        ))}
      </div>
    </div>
  );
}
