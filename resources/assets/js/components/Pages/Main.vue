<template>
    <div>
        <slider></slider>
        <partners></partners>
    </div>
</template>

<script>
    import Lang from './../Elements/Lang.vue';
    import Slider from './../Elements/Tslider';
    import Partners from './../Elements/PartnersMain.vue';
    export default {
        mounted() {
            console.log('MainPage mounted.')
        },
        components:{
            Slider,Partners
        },
        head:{
            title:{
                inner: 'Decor CuDrag',
                separator:' ',
            },
            meta: [
                { name: 'application-name', content: 'CuDrag' }
                ]
        },
    }
</script>
