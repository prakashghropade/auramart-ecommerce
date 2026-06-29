import Link from "next/link";
import React from "react";
import { FaBagShopping } from "react-icons/fa6";

const Logo = () => {
  return (
    <Link href={"/"} className="flex gap-3 items-center group">
      <span className="text-4xl text-primary transition-transform duration-300 group-hover:scale-110 drop-shadow-lg">
        <FaBagShopping />
      </span>
      <div>
        <p className="text-2xl font-bold tracking-tight whitespace-nowrap">
          Aura<span className="text-primary">Mart</span>
        </p>
      </div>
    </Link>
  );
};

export default Logo;
