import{bV as _,r,bY as M,c8 as D,j as b,bZ as y,b_ as E,b$ as B,c_ as O,c$ as A,m as H,d0 as K,bw as L}from"./index-BxRPZUbt.js";var v="Checkbox",[$,Z]=_(v),[q,z]=$(v),P=r.forwardRef((e,a)=>{const{__scopeCheckbox:t,name:c,checked:p,defaultChecked:s,required:h,disabled:d,value:u="on",onCheckedChange:m,...g}=e,[n,x]=r.useState(null),I=M(a,o=>x(o)),k=r.useRef(!1),w=n?!!n.closest("form"):!0,[l=!1,C]=D({prop:p,defaultProp:s,onChange:m}),N=r.useRef(l);return r.useEffect(()=>{const o=n==null?void 0:n.form;if(o){const f=()=>C(N.current);return o.addEventListener("reset",f),()=>o.removeEventListener("reset",f)}},[n,C]),b.jsxs(q,{scope:t,state:l,disabled:d,children:[b.jsx(y.button,{type:"button",role:"checkbox","aria-checked":i(l)?"mixed":l,"aria-required":h,"data-state":S(l),"data-disabled":d?"":void 0,disabled:d,value:u,...g,ref:I,onKeyDown:E(e.onKeyDown,o=>{o.key==="Enter"&&o.preventDefault()}),onClick:E(e.onClick,o=>{C(f=>i(f)?!0:!f),w&&(k.current=o.isPropagationStopped(),k.current||o.stopPropagation())})}),w&&b.jsx(T,{control:n,bubbles:!k.current,name:c,value:u,checked:l,required:h,disabled:d,style:{transform:"translateX(-100%)"}})]})});P.displayName=v;var R="CheckboxIndicator",j=r.forwardRef((e,a)=>{const{__scopeCheckbox:t,forceMount:c,...p}=e,s=z(R,t);return b.jsx(B,{present:c||i(s.state)||s.state===!0,children:b.jsx(y.span,{"data-state":S(s.state),"data-disabled":s.disabled?"":void 0,...p,ref:a,style:{pointerEvents:"none",...e.style}})})});j.displayName=R;var T=e=>{const{control:a,checked:t,bubbles:c=!0,...p}=e,s=r.useRef(null),h=O(t),d=A(a);return r.useEffect(()=>{const u=s.current,m=window.HTMLInputElement.prototype,n=Object.getOwnPropertyDescriptor(m,"checked").set;if(h!==t&&n){const x=new Event("click",{bubbles:c});u.indeterminate=i(t),n.call(u,i(t)?!1:t),u.dispatchEvent(x)}},[h,t,c]),b.jsx("input",{type:"checkbox","aria-hidden":!0,defaultChecked:i(t)?!1:t,...p,tabIndex:-1,ref:s,style:{...e.style,...d,position:"absolute",pointerEvents:"none",opacity:0,margin:0}})};function i(e){return e==="indeterminate"}function S(e){return i(e)?"indeterminate":e?"checked":"unchecked"}var X=P,F=j;const V=r.forwardRef(({className:e,checked:a,...t},c)=>r.createElement(X,{...t,ref:c,checked:a,className:H("group relative inline-flex h-5 w-5 items-center justify-center outline-none ",e)},r.createElement("div",{className:"text-ui-fg-on-inverted bg-ui-bg-base shadow-borders-base group-hover:bg-ui-bg-base-hover group-focus-visible:!shadow-borders-interactive-with-focus group-data-[state=checked]:bg-ui-bg-interactive group-data-[state=checked]:shadow-borders-interactive-with-shadow group-data-[state=indeterminate]:bg-ui-bg-interactive group-data-[state=indeterminate]:shadow-borders-interactive-with-shadow [&_path]:shadow-details-contrast-on-bg-interactive group-disabled:text-ui-fg-disabled group-disabled:!bg-ui-bg-disabled group-disabled:!shadow-borders-base transition-fg h-[14px] w-[14px] rounded-[3px]"},r.createElement(F,{className:"absolute inset-0 flex items-center justify-center"},a==="indeterminate"?r.createElement(K,null):r.createElement(L,null)))));V.displayName="Checkbox";export{V as C};