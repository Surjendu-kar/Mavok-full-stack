import{g as h,p as v,a as _,b as j}from"./chunk-G22WWLPG-C9g-VuwI.js";import{a as g}from"./chunk-B4FQDBC3-Bd8wLL4N.js";import{a as A}from"./chunk-MSDRGCRR-Wo7ejLev.js";import{S as T}from"./chunk-ADOCJB6L-BAtYHWA7.js";import{S as M,a as S}from"./chunk-2RQLKDBF-DppJ2vsa.js";import{c as K,a as w,j as a,b as u,f0 as C,H as P,T as D,L as N,B as E,r as q,Y as z,k as L,f1 as O,f2 as R,A as H,t as m}from"./index-BxRPZUbt.js";import{u as B,D as F}from"./chunk-OYHBAUAW-Bh910uOp.js";import"./lodash-Wa3tNvWF.js";import{u as J}from"./chunk-C76H5USB-C4KynttQ.js";import"./chunk-FZFMTVUS-B6epN2ER.js";import"./chunk-BNLHRJ2A-Cy9oezEa.js";import"./chunk-KHOKHZC6-BT2W526V.js";import{P as Y}from"./pencil-square-DPRnN69u.js";import{X as I}from"./x-circle-CLORXDR5.js";import{T as Q}from"./trash-D7gRgiti.js";import{u as X}from"./use-prompt-CljjOm9N.js";import{C as G}from"./container-C8-EYVG6.js";import{c as U}from"./index-BpYtoVSX.js";import"./chunk-P3UUX2T6-BqASRlOM.js";import"./format-CSM4n_jz.js";import"./Trans-Djefil4l.js";import"./x-mark-mini-CdT8Gfml.js";import"./check-CgVhTlWH.js";import"./chunk-YEDAFXMB-Q_4fYbM3.js";import"./chunk-AOFGTNG6-D4HQXs0t.js";import"./chunk-WX2SMNCD-CYNKb9PK.js";import"./plus-mini-CSilrpvR.js";import"./command-bar-Bfh-9oY8.js";import"./index-B2CyCadw.js";import"./chunk-IVEEMMLZ-CPRLM5_J.js";import"./date-picker-BUKrjaEd.js";import"./clsx-B-dksMZM.js";import"./popover-DP_copnG.js";import"./triangle-left-mini-BVg8f3e8.js";import"./prompt-Ad_DCR5S.js";var W=({apiKey:t})=>{const{mutateAsync:e}=O(t.id),{mutateAsync:r}=R(t.id),{t:s}=u(),i=X(),l=async()=>{await i({title:s("general.areYouSure"),description:s("apiKeyManagement.delete.warning",{title:t.title}),confirmText:s("actions.delete"),cancelText:s("actions.cancel")})&&await r(void 0,{onSuccess:()=>{m.success(s("apiKeyManagement.delete.successToast",{title:t.title}))},onError:c=>{m.error(c.message)}})},o=async()=>{await i({title:s("general.areYouSure"),description:s("apiKeyManagement.revoke.warning",{title:t.title}),confirmText:s("apiKeyManagement.actions.revoke"),cancelText:s("actions.cancel")})&&await e(void 0,{onSuccess:()=>{m.success(s("apiKeyManagement.revoke.successToast",{title:t.title}))},onError:c=>{m.error(c.message)}})},d=()=>{navigator.clipboard.writeText(t.token),m.success(s("apiKeyManagement.actions.copySuccessToast"))};return a.jsx(H,{groups:[{actions:[{icon:a.jsx(Y,{}),label:s("actions.edit"),to:`${t.id}/edit`},...t.type!=="secret"?[{label:s("apiKeyManagement.actions.copy"),onClick:d,icon:a.jsx(S,{})}]:[]]},{actions:[{icon:a.jsx(I,{}),label:s("apiKeyManagement.actions.revoke"),onClick:o,disabled:!!t.revoked_at},{icon:a.jsx(Q,{}),label:s("actions.delete"),onClick:l,disabled:!t.revoked_at}]}]})},n=U(),Z=()=>{const{t}=u();return q.useMemo(()=>[n.accessor("title",{header:t("fields.title"),cell:({getValue:e})=>a.jsx("div",{className:"flex size-full items-center",children:a.jsx("span",{className:"truncate",children:e()})})}),n.accessor("redacted",{header:"Token",cell:({getValue:e})=>{const r=e();return a.jsx(z,{size:"2xsmall",children:v(r)})}}),n.accessor("type",{header:t("fields.type"),cell:({getValue:e})=>{const{label:r}=_(e(),t);return a.jsx(A,{text:r})}}),n.accessor("revoked_at",{header:t("fields.status"),cell:({getValue:e})=>{const{color:r,label:s}=j(e(),t);return a.jsx(T,{color:r,children:s})}}),n.accessor("last_used_at",{header:t("apiKeyManagement.table.lastUsedAtHeader"),cell:({getValue:e})=>{const r=e();return a.jsx(g,{date:r})}}),n.accessor("created_at",{header:t("fields.created"),cell:({getValue:e})=>{const r=e();return a.jsx(g,{date:r})}}),n.display({id:"actions",cell:({row:e})=>a.jsx(W,{apiKey:e.original})})],[t])},$=()=>{const{t}=u();let e=[];const r=[{label:t("fields.createdAt"),key:"created_at",type:"date"},{label:t("fields.updatedAt"),key:"updated_at",type:"date"},{label:t("fields.revokedAt"),key:"revoked_at",type:"date"}];return e=[...e,...r],e},V=({prefix:t,pageSize:e=20})=>{const r=J(["offset","q","created_at","updated_at","revoked_at","order"],t),{offset:s,created_at:i,updated_at:l,revoked_at:o,q:d,order:p}=r;return{searchParams:{limit:e,offset:s?Number(s):0,created_at:i?JSON.parse(i):void 0,updated_at:l?JSON.parse(l):void 0,revoked_at:o?JSON.parse(o):void 0,order:p,q:d},raw:r}},y=20,ee=({keyType:t})=>{const{t:e}=u(),{searchParams:r,raw:s}=V({pageSize:y}),i={...r,type:t,fields:"id,title,redacted,token,type,created_at,updated_at,revoked_at,last_used_at,created_by,revoked_by"},{api_keys:l,count:o,isLoading:d,isError:p,error:c}=C(i,{placeholderData:L}),k=$(),b=Z(),{table:x}=B({data:l||[],columns:b,count:o,enablePagination:!0,getRowId:f=>f.id,pageSize:y});if(p)throw c;return a.jsxs(G,{className:"divide-y p-0",children:[a.jsxs("div",{className:"flex items-center justify-between px-6 py-4",children:[a.jsxs("div",{children:[a.jsx(P,{level:"h2",children:e(t==="publishable"?"apiKeyManagement.domain.publishable":"apiKeyManagement.domain.secret")}),a.jsx(D,{className:"text-ui-fg-subtle",size:"small",children:e(t==="publishable"?"apiKeyManagement.subtitle.publishable":"apiKeyManagement.subtitle.secret")})]}),a.jsx(N,{to:"create",children:a.jsx(E,{variant:"secondary",size:"small",children:e("actions.create")})})]}),a.jsx(F,{table:x,filters:k,columns:b,count:o,pageSize:y,orderBy:[{key:"title",label:e("fields.title")},{key:"created_at",label:e("fields.createdAt")},{key:"updated_at",label:e("fields.updatedAt")},{key:"revoked_at",label:e("fields.revokedAt")}],navigateTo:f=>f.id,pagination:!0,search:!0,queryObject:s,isLoading:d})]})},ze=()=>{const{pathname:t}=K(),{getWidgets:e}=w(),r=h(t);return a.jsx(M,{hasOutlet:!0,widgets:{before:e("api_key.list.before"),after:e("api_key.list.after")},children:a.jsx(ee,{keyType:r})})};export{ze as Component};