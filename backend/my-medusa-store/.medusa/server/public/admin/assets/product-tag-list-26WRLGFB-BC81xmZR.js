import{u as T}from"./chunk-IDXWB5O6-CS_Ced8V.js";import{u as h}from"./chunk-D2UCOBBT-C5ROMLX-.js";import{q as m,a as b,j as a,eR as x,s as j,b as p,d as P,b9 as v,k as D,H as w,B as C,L,r as S,A as q}from"./index-BxRPZUbt.js";import{a as k}from"./chunk-5R4UGQUP-4n0M-8kA.js";import{a as A}from"./chunk-IRV425DP-CIElwA1Q.js";import{S as E}from"./chunk-2RQLKDBF-DppJ2vsa.js";import{u as _,D as O}from"./chunk-OYHBAUAW-Bh910uOp.js";import"./lodash-Wa3tNvWF.js";import"./chunk-FZFMTVUS-B6epN2ER.js";import"./chunk-BNLHRJ2A-Cy9oezEa.js";import"./chunk-KHOKHZC6-BT2W526V.js";import{P as Q}from"./pencil-square-DPRnN69u.js";import{T as R}from"./trash-D7gRgiti.js";import{C as z}from"./container-C8-EYVG6.js";import{c as H}from"./index-BpYtoVSX.js";import"./use-prompt-CljjOm9N.js";import"./prompt-Ad_DCR5S.js";import"./chunk-B4FQDBC3-Bd8wLL4N.js";import"./chunk-P3UUX2T6-BqASRlOM.js";import"./format-CSM4n_jz.js";import"./chunk-MSDRGCRR-Wo7ejLev.js";import"./chunk-C76H5USB-C4KynttQ.js";import"./chunk-W7625H47-BR4t6Gd7.js";import"./Trans-Djefil4l.js";import"./x-mark-mini-CdT8Gfml.js";import"./check-CgVhTlWH.js";import"./chunk-YEDAFXMB-Q_4fYbM3.js";import"./chunk-AOFGTNG6-D4HQXs0t.js";import"./chunk-WX2SMNCD-CYNKb9PK.js";import"./plus-mini-CSilrpvR.js";import"./command-bar-Bfh-9oY8.js";import"./index-B2CyCadw.js";import"./chunk-IVEEMMLZ-CPRLM5_J.js";import"./date-picker-BUKrjaEd.js";import"./clsx-B-dksMZM.js";import"./popover-DP_copnG.js";import"./triangle-left-mini-BVg8f3e8.js";var N=t=>({queryKey:x.list(t),queryFn:async()=>j.admin.productTag.list(t)}),Lt=async({request:t})=>{const e=new URL(t.url).searchParams,r={};e.forEach((i,s)=>{try{r[s]=JSON.parse(i)}catch{r[s]=i}});const o=N(r);return m.getQueryData(o.queryKey)??await m.fetchQuery(o)},c=20,B=()=>{const{t}=p(),{searchParams:e,raw:r}=k({pageSize:c}),o=P(),{product_tags:i,count:s,isPending:l,isError:d,error:g}=v(e,{initialData:o,placeholderData:D}),u=F(),f=A(),{table:y}=_({data:i,count:s,columns:u,getRowId:n=>n.id,pageSize:c});if(d)throw g;return a.jsxs(z,{className:"divide-y px-0 py-0",children:[a.jsxs("div",{className:"flex items-center justify-between px-6 py-4",children:[a.jsx(w,{children:t("productTags.domain")}),a.jsx(C,{variant:"secondary",size:"small",asChild:!0,children:a.jsx(L,{to:"create",children:t("actions.create")})})]}),a.jsx(O,{table:y,filters:f,queryObject:r,isLoading:l,columns:u,pageSize:c,count:s,navigateTo:n=>n.original.id,search:!0,pagination:!0,orderBy:[{key:"value",label:t("fields.value")},{key:"created_at",label:t("fields.createdAt")},{key:"updated_at",label:t("fields.updatedAt")}]})]})},K=({productTag:t})=>{const{t:e}=p(),r=T({productTag:t});return a.jsx(q,{groups:[{actions:[{icon:a.jsx(Q,{}),label:e("actions.edit"),to:`${t.id}/edit`}]},{actions:[{icon:a.jsx(R,{}),label:e("actions.delete"),onClick:r}]}]})},M=H(),F=()=>{const t=h();return S.useMemo(()=>[...t,M.display({id:"actions",cell:({row:e})=>a.jsx(K,{productTag:e.original})})],[t])},St=()=>{const{getWidgets:t}=b();return a.jsx(E,{showMetadata:!1,showJSON:!1,hasOutlet:!0,widgets:{after:t("product_tag.list.after"),before:t("product_tag.list.before")},children:a.jsx(B,{})})};export{St as Component,Lt as loader};
