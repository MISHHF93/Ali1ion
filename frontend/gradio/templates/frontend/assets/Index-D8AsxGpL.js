import{M as I}from"./Index.svelte_svelte_type_style_lang-D199jKmZ.js";import{S as A}from"./Index-D21IHG0c.js";import{B as D}from"./Button-uOcat6Z0.js";import{default as se}from"./Example-CoyKMtl3.js";import{M as le}from"./Example.svelte_svelte_type_style_lang-qahm4PWk.js";import"./Blocks-Dw_9NR1K.js";import"./index-D5ROCp7B.js";import"./svelte/svelte.js";import"./Check-CZUQOzJl.js";import"./Copy-B6RcHnoK.js";import"./prism-python-Bw3EYPE-.js";const{SvelteComponent:F,assign:G,attr:H,create_component:c,destroy_component:d,detach:S,element:J,flush:o,get_spread_object:K,get_spread_update:L,init:N,insert:C,mount_component:b,safe_not_equal:O,space:P,toggle_class:j,transition_in:k,transition_out:w}=window.__gradio__svelte__internal;function Q(s){let e,n,a,_,h;const u=[{autoscroll:s[8].autoscroll},{i18n:s[8].i18n},s[4],{variant:"center"}];let m={};for(let t=0;t<u.length;t+=1)m=G(m,u[t]);return e=new A({props:m}),e.$on("clear_status",s[14]),_=new I({props:{min_height:s[4]&&s[4].status!=="complete",value:s[3],elem_classes:s[1],visible:s[2],rtl:s[5],latex_delimiters:s[9],sanitize_html:s[6],line_breaks:s[7],header_links:s[10],height:s[11],show_copy_button:s[12],root:s[8].root}}),_.$on("change",s[15]),{c(){c(e.$$.fragment),n=P(),a=J("div"),c(_.$$.fragment),H(a,"class","svelte-1ed2p3z"),j(a,"pending",s[4]?.status==="pending")},m(t,l){b(e,t,l),C(t,n,l),C(t,a,l),b(_,a,null),h=!0},p(t,l){const g=l&272?L(u,[l&256&&{autoscroll:t[8].autoscroll},l&256&&{i18n:t[8].i18n},l&16&&K(t[4]),u[3]]):{};e.$set(g);const r={};l&16&&(r.min_height=t[4]&&t[4].status!=="complete"),l&8&&(r.value=t[3]),l&2&&(r.elem_classes=t[1]),l&4&&(r.visible=t[2]),l&32&&(r.rtl=t[5]),l&512&&(r.latex_delimiters=t[9]),l&64&&(r.sanitize_html=t[6]),l&128&&(r.line_breaks=t[7]),l&1024&&(r.header_links=t[10]),l&2048&&(r.height=t[11]),l&4096&&(r.show_copy_button=t[12]),l&256&&(r.root=t[8].root),_.$set(r),(!h||l&16)&&j(a,"pending",t[4]?.status==="pending")},i(t){h||(k(e.$$.fragment,t),k(_.$$.fragment,t),h=!0)},o(t){w(e.$$.fragment,t),w(_.$$.fragment,t),h=!1},d(t){t&&(S(n),S(a)),d(e,t),d(_)}}}function R(s){let e,n;return e=new D({props:{visible:s[2],elem_id:s[0],elem_classes:s[1],container:!1,allow_overflow:!0,$$slots:{default:[Q]},$$scope:{ctx:s}}}),{c(){c(e.$$.fragment)},m(a,_){b(e,a,_),n=!0},p(a,[_]){const h={};_&4&&(h.visible=a[2]),_&1&&(h.elem_id=a[0]),_&2&&(h.elem_classes=a[1]),_&73726&&(h.$$scope={dirty:_,ctx:a}),e.$set(h)},i(a){n||(k(e.$$.fragment,a),n=!0)},o(a){w(e.$$.fragment,a),n=!1},d(a){d(e,a)}}}function T(s,e,n){let{label:a}=e,{elem_id:_=""}=e,{elem_classes:h=[]}=e,{visible:u=!0}=e,{value:m=""}=e,{loading_status:t}=e,{rtl:l=!1}=e,{sanitize_html:g=!0}=e,{line_breaks:r=!1}=e,{gradio:f}=e,{latex_delimiters:v}=e,{header_links:z=!1}=e,{height:M=void 0}=e,{show_copy_button:B=!1}=e;const q=()=>f.dispatch("clear_status",t),E=()=>f.dispatch("change");return s.$$set=i=>{"label"in i&&n(13,a=i.label),"elem_id"in i&&n(0,_=i.elem_id),"elem_classes"in i&&n(1,h=i.elem_classes),"visible"in i&&n(2,u=i.visible),"value"in i&&n(3,m=i.value),"loading_status"in i&&n(4,t=i.loading_status),"rtl"in i&&n(5,l=i.rtl),"sanitize_html"in i&&n(6,g=i.sanitize_html),"line_breaks"in i&&n(7,r=i.line_breaks),"gradio"in i&&n(8,f=i.gradio),"latex_delimiters"in i&&n(9,v=i.latex_delimiters),"header_links"in i&&n(10,z=i.header_links),"height"in i&&n(11,M=i.height),"show_copy_button"in i&&n(12,B=i.show_copy_button)},s.$$.update=()=>{s.$$.dirty&8448&&f.dispatch("change")},[_,h,u,m,t,l,g,r,f,v,z,M,B,a,q,E]}class p extends F{constructor(e){super(),N(this,e,T,R,O,{label:13,elem_id:0,elem_classes:1,visible:2,value:3,loading_status:4,rtl:5,sanitize_html:6,line_breaks:7,gradio:8,latex_delimiters:9,header_links:10,height:11,show_copy_button:12})}get label(){return this.$$.ctx[13]}set label(e){this.$$set({label:e}),o()}get elem_id(){return this.$$.ctx[0]}set elem_id(e){this.$$set({elem_id:e}),o()}get elem_classes(){return this.$$.ctx[1]}set elem_classes(e){this.$$set({elem_classes:e}),o()}get visible(){return this.$$.ctx[2]}set visible(e){this.$$set({visible:e}),o()}get value(){return this.$$.ctx[3]}set value(e){this.$$set({value:e}),o()}get loading_status(){return this.$$.ctx[4]}set loading_status(e){this.$$set({loading_status:e}),o()}get rtl(){return this.$$.ctx[5]}set rtl(e){this.$$set({rtl:e}),o()}get sanitize_html(){return this.$$.ctx[6]}set sanitize_html(e){this.$$set({sanitize_html:e}),o()}get line_breaks(){return this.$$.ctx[7]}set line_breaks(e){this.$$set({line_breaks:e}),o()}get gradio(){return this.$$.ctx[8]}set gradio(e){this.$$set({gradio:e}),o()}get latex_delimiters(){return this.$$.ctx[9]}set latex_delimiters(e){this.$$set({latex_delimiters:e}),o()}get header_links(){return this.$$.ctx[10]}set header_links(e){this.$$set({header_links:e}),o()}get height(){return this.$$.ctx[11]}set height(e){this.$$set({height:e}),o()}get show_copy_button(){return this.$$.ctx[12]}set show_copy_button(e){this.$$set({show_copy_button:e}),o()}}export{se as BaseExample,I as BaseMarkdown,le as MarkdownCode,p as default};
//# sourceMappingURL=Index-D8AsxGpL.js.map
