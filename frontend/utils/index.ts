export const formatPrice = (price: number) => {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
};

export const getLowestPrice = (item: Accessories) => {
  // if (!item.options || item.options.length === 0) {
  //   return item.price;
  // }
  const optionPrices = item.options.map(option => parseInt(option.price));
  return Math.min(item.price, ...optionPrices);
};

export const getLocalStorage = (key: string) => {
  return localStorage.getItem(key)
    ? JSON.parse(localStorage.getItem(key) || '')
    : [];
};

export const setLocalStorage = (key: string, value: unknown) => {
  localStorage.setItem(key, JSON.stringify(value));
};

export const removeLocalStorage = (key: string) => {
  localStorage.removeItem(key);
};
