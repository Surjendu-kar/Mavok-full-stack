import{u as F,a as M,b as B}from"./chunk-VELNOPU6-DjobB5vH.js";import{a1 as H,ad as I,a3 as N,R as O,aS as V,j as s,b as $,a8 as q,a9 as G,r as p,J,eM as Q,t as y,B as j,k as U}from"./index-BxRPZUbt.js";import{u as Z,D as K}from"./chunk-OYHBAUAW-Bh910uOp.js";import"./lodash-Wa3tNvWF.js";import"./chunk-FZFMTVUS-B6epN2ER.js";import"./chunk-BNLHRJ2A-Cy9oezEa.js";import"./chunk-KHOKHZC6-BT2W526V.js";import{R as i,u as W}from"./chunk-6DAFMWMA-CLcEtfHI.js";import{C as b}from"./checkbox-CGs03nqI.js";import{c as X}from"./index-BpYtoVSX.js";import"./chunk-GA34GXNI-Dgpdzpbf.js";import"./chunk-P3UUX2T6-BqASRlOM.js";import"./chunk-MSDRGCRR-Wo7ejLev.js";import"./chunk-ADOCJB6L-BAtYHWA7.js";import"./chunk-C76H5USB-C4KynttQ.js";import"./chunk-YEDAFXMB-Q_4fYbM3.js";import"./chunk-AOFGTNG6-D4HQXs0t.js";import"./chunk-WX2SMNCD-CYNKb9PK.js";import"./plus-mini-CSilrpvR.js";import"./command-bar-Bfh-9oY8.js";import"./index-B2CyCadw.js";import"./chunk-IVEEMMLZ-CPRLM5_J.js";import"./format-CSM4n_jz.js";import"./date-picker-BUKrjaEd.js";import"./clsx-B-dksMZM.js";import"./popover-DP_copnG.js";import"./x-mark-mini-CdT8Gfml.js";import"./triangle-left-mini-BVg8f3e8.js";import"./prompt-Ad_DCR5S.js";var Y=H({sales_channels:I(N()).optional()}),m=50,ee=({location:a})=>{var f,g;const{t:e}=$(),{handleSuccess:o}=W(),l=q({defaultValues:{sales_channels:((f=a.sales_channels)==null?void 0:f.map(t=>t.id))??[]},resolver:G(Y)}),{setValue:c}=l,d=((g=a.sales_channels)==null?void 0:g.reduce((t,r)=>(t[r.id]=!0,t),{}))??{},[u,k]=p.useState(d);p.useEffect(()=>{const t=Object.keys(u);c("sales_channels",t,{shouldDirty:!0,shouldTouch:!0})},[u,c]);const{searchParams:v,raw:_}=F({pageSize:m}),{sales_channels:w,count:h,isLoading:P,isError:R,error:T}=J({...v},{placeholderData:U}),E=M(),S=ae(),{table:L}=Z({data:w??[],columns:S,count:h,enablePagination:!0,enableRowSelection:!0,rowSelection:{state:u,updater:k},getRowId:t=>t.id,pageSize:m}),{mutateAsync:A,isPending:D}=Q(a.id),z=l.handleSubmit(async t=>{var x;const r=(x=a.sales_channels)==null?void 0:x.map(n=>n.id),C=t.sales_channels??[];await A({add:C.filter(n=>!(r!=null&&r.includes(n))),remove:r==null?void 0:r.filter(n=>!C.includes(n))},{onSuccess:()=>{y.success(e("stockLocations.salesChannels.successToast")),o(`/settings/locations/${a.id}`)},onError:n=>{y.error(n.message)}})});if(R)throw T;return s.jsx(i.Form,{form:l,children:s.jsxs("div",{className:"flex h-full flex-col overflow-hidden",children:[s.jsx(i.Header,{children:s.jsxs("div",{className:"flex items-center justify-end gap-x-2",children:[s.jsx(i.Close,{asChild:!0,children:s.jsx(j,{size:"small",variant:"secondary",children:e("actions.cancel")})}),s.jsx(j,{size:"small",isLoading:D,onClick:z,children:e("actions.save")})]})}),s.jsx(i.Body,{children:s.jsx(K,{table:L,columns:S,pageSize:m,isLoading:P,count:h,filters:E,search:"autofocus",pagination:!0,orderBy:[{key:"name",label:e("fields.name")},{key:"created_at",label:e("fields.createdAt")},{key:"updated_at",label:e("fields.updatedAt")}],queryObject:_,layout:"fill"})})]})})},se=X(),ae=()=>{const a=B();return p.useMemo(()=>[se.display({id:"select",header:({table:e})=>s.jsx(b,{checked:e.getIsSomePageRowsSelected()?"indeterminate":e.getIsAllPageRowsSelected(),onCheckedChange:o=>e.toggleAllPageRowsSelected(!!o)}),cell:({row:e})=>s.jsx(b,{checked:e.getIsSelected(),onCheckedChange:o=>e.toggleSelected(!!o),onClick:o=>{o.stopPropagation()}})}),...a],[a])},Ae=()=>{const{location_id:a}=O(),{stock_location:e,isPending:o,isError:l,error:c}=V(a,{fields:"id,*sales_channels"}),d=!o&&!!e;if(l)throw c;return s.jsx(i,{children:d&&s.jsx(ee,{location:e})})};export{Ae as Component};