import{P as l}from"./chunk-P3UUX2T6-BqASRlOM.js";import{f as a}from"./format-CSM4n_jz.js";import{j as e,V as n,b as o}from"./index-BxRPZUbt.js";var u=({date:t})=>{if(!t)return e.jsx(l,{});const s=new Date(t);s.setMinutes(s.getMinutes()-s.getTimezoneOffset());const r=Intl.DateTimeFormat().resolvedOptions().hour12?"dd MMM yyyy hh:MM a":"dd MMM yyyy HH:MM";return e.jsx("div",{className:"flex h-full w-full items-center overflow-hidden",children:e.jsx(n,{className:"z-10",content:e.jsx("span",{className:"text-pretty",children:`${a(s,r)}`}),children:e.jsx("span",{className:"truncate",children:a(s,"dd MMM yyyy")})})})},f=()=>{const{t}=o();return e.jsx("div",{className:"flex h-full w-full items-center",children:e.jsx("span",{className:"truncate",children:t("fields.date")})})};export{f as D,u as a};
