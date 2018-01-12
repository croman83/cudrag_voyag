
window.Vue = require('vue');
require('./bootstrap');

window.Velocity = require('velocity-animate');

import Vuex from 'vuex';
Vue.use(Vuex);

import VueRouter from 'vue-router'
Vue.use(VueRouter);

import VueHead from 'vue-head';
Vue.use(VueHead);

import VueI18n from 'vue-i18n';
Vue.use(VueI18n);



require('lightgallery.js');


let token = document.head.querySelector('meta[name="csrf-token"]');

var VueResource = require('vue-resource');
Vue.use(VueResource);

// Vue.http.headers.common['X-CSRF-TOKEN'] = token;
Vue.http.interceptors.push(function(request, next) {
    request.headers.set('X-CSRF-TOKEN', token.content);
    next();
});
Vue.http.headers.common['Access-Control-Allow-Origin'] = '*';

const { locale, translations } = window.config

const i18n = new VueI18n({
    locale,
    messages: {
        [locale]: translations
    }
})

Vue.config.productionTip = false;




import Header from './components/Base/Header.vue'
import Footer from './components/Base/Footer.vue'
import Loading from './components/Elements/Loading.vue'

import Main from './components/Pages/Main.vue'
import PageNotFound from './components/Pages/PageNotFound.vue'



import store from './store';




const router = new VueRouter({
    mode: 'history',
    base: locale,
    routes: [
        { path: '/', component: Main , name:'home' },
        { path: '/category', component: PageNotFound },
        // { path: '/category/:slug', component: OneCategory, props:true , name:'category' },
        // { path: '/service', component: Services, props:true , name:'service' },
        // { path: '/service/:slug', component: OneCategory, props:true , name:'services' },
        // { path: '/product/:slug', component: ProductDefault, props:true , name:'product' },
        { path: '/*', component: PageNotFound },
    ]
});

const app = new Vue({
    router,
    i18n,
    store,
    components:{
        appHeader:Header,
        appFooter:Footer,
        loading:Loading,
    },
    mounted(){
        this.$loading = this.$refs.loading;
    }
    }).$mount('#app');


router.beforeEach((to, from, next) => {
    router.app.$loading.start();
    router.app.$refs.header.hide();
    setTimeout(next,300);
});
router.afterEach((to, from) => {
    router.app.$loading.finish();
    Velocity(document.body,"scroll", { offset: "0", mobileHA: false });

});




window.Vue.directive('Clickoutside',{
    bind: function(el, binding, vNode) {
        // Provided expression must evaluate to a function.
        if (typeof binding.value !== 'function') {
            const compName = vNode.context.name
            let warn = `[Vue-click-outside:] provided expression '${binding.expression}' is not a function, but has to be`
            if (compName) { warn += `Found in component '${compName}'` }

            console.warn(warn)
        }
        // Define Handler and cache it on the element
        const bubble = binding.modifiers.bubble
        const handler = (e) => {
            if (bubble || (!el.contains(e.target) && el !== e.target)) {
                binding.value(e)
            }
        }
        el.__vueClickOutside__ = handler

        // add Event Listeners
        document.addEventListener('click', handler)
    },

    unbind: function(el, binding) {
        // Remove Event Listeners
        document.removeEventListener('click', el.__vueClickOutside__)
        el.__vueClickOutside__ = null

    }
});

