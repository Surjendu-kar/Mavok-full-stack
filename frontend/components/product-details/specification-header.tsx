function SpecificationHeader({
  heading,
  desc,
  main,
}: {
  heading: string;
  desc: string;
  main: string;
}) {
  return (
    <div className="flex flex-col justify-center items-center">
      <p className="text-green-600 uppercase text-sm font-medium ">{main}</p>
      <h2 className="text-3xl font-bold text-gray-900 uppercase">{heading}</h2>
      <p className="text-gray-600 max-w-2xl ">{desc}</p>
    </div>
  );
}

export default SpecificationHeader;
