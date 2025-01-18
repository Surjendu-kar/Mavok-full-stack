import React from 'react';

const ProductSpecifications = ({
  specData,
}: {
  specData: {
    type: string;
    value: string;
  }[];
}) => {
  return (
    <div className="w-full max-w-6xl mx-auto">
      {/* Specifications Content */}
      <div className="bg-white rounded-lg p-6 w-full">
        <h3 className="text-md uppercase font-bold text-gray-800 border-t pt-4 mb-8">
          Technical Specifications
        </h3>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-y-6 text-sm">
          {specData.map((spec, index) => (
            <div key={index} className="flex items-start border-b pb-4 pr-4">
              <div className="w-2/5">
                <p className="font-semibold uppercase text-gray-800">
                  {spec.type}
                </p>
              </div>
              <div className="w-3/5">
                <p className="text-gray-600">{spec.value}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default ProductSpecifications;
