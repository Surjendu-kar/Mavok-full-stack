import{r as i,b as p,j as e,m as d,d2 as x}from"./index-BxRPZUbt.js";import{T as v}from"./triangles-mini-tCJv45fO.js";var g=i.forwardRef(({className:l,disabled:a,placeholder:u,value:s,defaultValue:o,...c},f)=>{var n;const{t:b}=p(),t=i.useRef(null);i.useImperativeHandle(f,()=>t.current);const m=((n=t.current)==null?void 0:n.value)==="";return e.jsxs("div",{className:"relative",children:[e.jsx(v,{className:d("text-ui-fg-muted transition-fg pointer-events-none absolute right-2 top-1/2 -translate-y-1/2",{"text-ui-fg-disabled":a})}),e.jsxs("select",{value:s!==void 0?s.toLowerCase():void 0,defaultValue:o?o.toLowerCase():void 0,disabled:a,className:d("bg-ui-bg-field shadow-buttons-neutral transition-fg txt-compact-small flex w-full select-none appearance-none items-center justify-between rounded-md px-2 py-1.5 outline-none","placeholder:text-ui-fg-muted text-ui-fg-base","hover:bg-ui-bg-field-hover","focus-visible:shadow-borders-interactive-with-active data-[state=open]:!shadow-borders-interactive-with-active","aria-[invalid=true]:border-ui-border-error aria-[invalid=true]:shadow-borders-error","invalid::border-ui-border-error invalid:shadow-borders-error","disabled:!bg-ui-bg-disabled disabled:!text-ui-fg-disabled",{"text-ui-fg-muted":m},l),...c,ref:t,children:[e.jsx("option",{value:"",disabled:!0,className:"text-ui-fg-muted",children:u||b("fields.selectCountry")}),x.map(r=>e.jsx("option",{value:r.iso_2.toLowerCase(),children:r.display_name},r.iso_2))]})]})});g.displayName="CountrySelect";export{g as C};
