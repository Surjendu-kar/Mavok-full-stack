import{P as W,u as X,b as Z}from"./chunk-O74CTF6Q-CqCFzrf_.js";import{e as J,i as U}from"./chunk-G2J2T2QU-DG3uwQuY.js";import{u as Y}from"./chunk-RJSD5KRU-BfsVzOGX.js";import{a5 as E,R as ee,dR as te,j as e,r as S,b as z,a8 as se,a9 as re,dV as ie,t as O,B as _,v as F,e as G,k as oe,V}from"./index-BxRPZUbt.js";import{D as ae}from"./chunk-ZF4OL2GU-DMAxl5Kt.js";import{u as ce,a as ne}from"./chunk-ZE4FSVPB-2qZwfadS.js";import{u as de,D as le}from"./chunk-OYHBAUAW-Bh910uOp.js";import"./lodash-Wa3tNvWF.js";import"./chunk-FZFMTVUS-B6epN2ER.js";import"./chunk-BNLHRJ2A-Cy9oezEa.js";import"./chunk-KHOKHZC6-BT2W526V.js";import{K as ue}from"./chunk-6HTZNHPT-Bt4ap2B-.js";import{R as y,u as H}from"./chunk-6DAFMWMA-CLcEtfHI.js";import{P as j}from"./progress-tabs-DlI2IPca.js";import{C as B}from"./checkbox-CGs03nqI.js";import{c as pe}from"./index-BpYtoVSX.js";import"./chunk-6GU6IDUA-CDc7wW5L.js";import"./chunk-RERSP5B2-CpYkKCYP.js";import"./chunk-ADOCJB6L-BAtYHWA7.js";import"./chunk-P3UUX2T6-BqASRlOM.js";import"./chunk-MWVM4TYO-bKUcYSnf.js";import"./index.esm-BVvMJMXx.js";import"./chunk-C76H5USB-C4KynttQ.js";import"./chunk-YEDAFXMB-Q_4fYbM3.js";import"./chunk-AOFGTNG6-D4HQXs0t.js";import"./chunk-WX2SMNCD-CYNKb9PK.js";import"./plus-mini-CSilrpvR.js";import"./command-bar-Bfh-9oY8.js";import"./index-B2CyCadw.js";import"./chunk-IVEEMMLZ-CPRLM5_J.js";import"./format-CSM4n_jz.js";import"./date-picker-BUKrjaEd.js";import"./clsx-B-dksMZM.js";import"./popover-DP_copnG.js";import"./x-mark-mini-CdT8Gfml.js";import"./triangle-left-mini-BVg8f3e8.js";import"./prompt-Ad_DCR5S.js";var me=({form:i,currencies:t,regions:a,pricePreferences:m})=>{const o=F({control:i.control,name:"product_ids"}),l=F({control:i.control,name:"products"}),{products:f,isLoading:n,isError:u,error:h}=G({id:o.map(d=>d.id),limit:o.length,fields:"title,thumbnail,*variants"}),{setValue:p}=i,{setCloseOnEscape:C}=H();S.useEffect(()=>{!n&&f&&f.forEach(d=>{l[d.id]||!d.variants||p(`products.${d.id}.variants`,{...d.variants.reduce((b,R)=>(b[R.id]={currency_prices:{},region_prices:{}},b),{})})})},[f,l,n,p]);const T=Z({currencies:t,regions:a,pricePreferences:m});if(u)throw h;return e.jsx("div",{className:"flex size-full flex-col divide-y overflow-hidden",children:e.jsx(ae,{isLoading:n,columns:T,data:f,getSubRows:d=>{if(U(d)&&d.variants)return d.variants},state:i,onEditingChange:d=>C(!d)})})},I=50,M="p";function fe(i){return i.reduce((t,a)=>(t[a.id]=!0,t),{})}var he=({priceList:i,form:t})=>{const{t:a}=z(),{control:m,setValue:o}=t,l=S.useMemo(()=>i.prices.reduce((s,x)=>(s[x.variant_id]=!0,s),{}),[i.prices]),f=F({control:m,name:"product_ids"}),n=F({control:m,name:"products"}),[u,h]=S.useState(fe(f)),{searchParams:p,raw:C}=ce({pageSize:I,prefix:M}),{products:T,count:d,isLoading:b,isError:R,error:w}=G(p,{placeholderData:oe}),A=s=>{const x=typeof s=="function"?s(u):s,g=Object.keys(x),q=Object.keys(n).reduce((k,D)=>(g.includes(D)&&(k[D]=n[D]),k),{}),Q=g.map(k=>({id:k}));o("product_ids",Q,{shouldDirty:!0,shouldTouch:!0}),o("products",q,{shouldDirty:!0,shouldTouch:!0}),h(x)},r=Pe(),P=ne(),{table:c}=de({data:T||[],columns:r,count:d,enablePagination:!0,enableRowSelection:s=>{var x,g;return!!((x=s.original.variants)!=null&&x.length)&&!((g=s.original.variants)!=null&&g.some(L=>l[L.id]))},getRowId:s=>s.id,rowSelection:{state:u,updater:A},pageSize:I,meta:{variantIdMap:l}});if(R)throw w;return e.jsx("div",{className:"flex size-full flex-col",children:e.jsx(le,{table:c,columns:r,filters:P,pageSize:I,prefix:M,count:d,isLoading:b,layout:"fill",orderBy:[{key:"title",label:a("fields.title")},{key:"status",label:a("fields.status")},{key:"created_at",label:a("fields.createdAt")},{key:"updated_at",label:a("fields.updatedAt")}],pagination:!0,search:!0,queryObject:C})})},xe=pe(),Pe=()=>{const i=Y();return S.useMemo(()=>[xe.display({id:"select",header:({table:t})=>e.jsx(B,{checked:t.getIsSomePageRowsSelected()?"indeterminate":t.getIsAllPageRowsSelected(),onCheckedChange:a=>t.toggleAllPageRowsSelected(!!a)}),cell:({row:t,table:a})=>{var u;const{variantIdMap:m}=a.options.meta,o=(u=t.original.variants)==null?void 0:u.some(h=>m[h.id]),l=!t.getCanSelect()||o,f=t.getIsSelected()||o,n=e.jsx(B,{checked:f,disabled:l,onCheckedChange:h=>t.toggleSelected(!!h),onClick:h=>{h.stopPropagation()}});return o?e.jsx(V,{content:"This product is already in the price list",children:n}):l?e.jsx(V,{content:"This product has no variants",children:n}):n}}),...i],[i])},N=E.object({product_ids:E.array(E.object({id:E.string()})).min(1),products:W}),$=N.pick({product_ids:!0}),K=Object.keys($.shape),ge=N.pick({products:!0}),ve=Object.keys(ge.shape),v=["product","price"],be={product:"in-progress",price:"not-started"},je=({priceList:i,regions:t,currencies:a,pricePreferences:m})=>{const[o,l]=S.useState("product"),[f,n]=S.useState(be),{t:u}=z(),{handleSuccess:h}=H(),p=se({defaultValues:{products:{},product_ids:[]},resolver:re(N)}),{mutateAsync:C,isPending:T}=ie(i.id),d=p.handleSubmit(async r=>{const{products:P}=r,c=J(P,t);await C({create:c},{onSuccess:()=>{O.success(u("priceLists.products.add.successToast")),h()},onError:s=>O.error(s.message)})}),b=(r,P)=>{p.clearErrors(r);const c=r.reduce((x,g)=>(x[g]=p.getValues(g),x),{}),s=P.safeParse(c);return s.success?!0:(s.error.errors.forEach(({path:x,message:g,code:L})=>{p.setError(x.join("."),{type:L,message:g})}),!1)},R=r=>{switch(r){case"product":return K.some(c=>p.getFieldState(c).isDirty);case"price":return ve.some(c=>p.getFieldState(c).isDirty)}},w=r=>{if(o===r)return;if(v.indexOf(r)<v.indexOf(o)){const c=R(o);n(s=>({...s,[o]:c?s[o]:"not-started",[r]:"in-progress"})),l(r);return}const P=v.slice(0,v.indexOf(r));for(const c of P)if(c==="product"){if(!b(K,$)){n(s=>({...s,[c]:"in-progress"})),l(c);return}n(s=>({...s,[c]:"completed"}))}n(c=>({...c,[o]:"completed",[r]:"in-progress"})),l(r)},A=r=>{if(v.indexOf(r)+1>=v.length)return;const P=v[v.indexOf(r)+1];w(P)};return e.jsx(y.Form,{form:p,children:e.jsx(j,{value:o,onValueChange:r=>w(r),className:"flex h-full flex-col overflow-hidden",children:e.jsxs(ue,{onSubmit:d,className:"flex h-full flex-col",children:[e.jsx(y.Header,{children:e.jsx("div",{className:"flex w-full items-center justify-between gap-x-4",children:e.jsx("div",{className:"-my-2 w-full max-w-[600px] border-l",children:e.jsxs(j.List,{className:"grid w-full grid-cols-3",children:[e.jsx(j.Trigger,{status:f.product,value:"product",children:u("priceLists.create.tabs.products")}),e.jsx(j.Trigger,{status:f.price,value:"price",children:u("priceLists.create.tabs.prices")})]})})})}),e.jsxs(y.Body,{className:"size-full overflow-hidden",children:[e.jsx(j.Content,{className:"size-full overflow-y-auto",value:"product",children:e.jsx(he,{form:p,priceList:i})}),e.jsx(j.Content,{className:"size-full overflow-hidden",value:"price",children:e.jsx(me,{form:p,regions:t,currencies:a,pricePreferences:m})})]}),e.jsx(y.Footer,{children:e.jsxs("div",{className:"flex items-center justify-end gap-x-2",children:[e.jsx(y.Close,{asChild:!0,children:e.jsx(_,{variant:"secondary",size:"small",children:u("actions.cancel")})}),e.jsx(ye,{tab:o,next:A,isLoading:T})]})})]})})})},ye=({tab:i,next:t,isLoading:a})=>{const{t:m}=z();return i==="price"?e.jsx(_,{type:"submit",variant:"primary",size:"small",isLoading:a,children:m("actions.save")},"submit-button"):e.jsx(_,{type:"button",variant:"primary",size:"small",onClick:()=>t(i),children:m("actions.continue")},"next-button")},at=()=>{const{id:i}=ee(),{price_list:t,isPending:a,isError:m,error:o}=te(i),{currencies:l,regions:f,pricePreferences:n,isReady:u}=X(),h=u&&!a&&!!t;if(m)throw o;return e.jsx(y,{children:h&&e.jsx(je,{priceList:t,currencies:l,regions:f,pricePreferences:n})})};export{at as Component};