<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        @include('head')
    </head>
    <body>
        <div id="app">
            <loading ref="loading"></loading>
            <dots ref="dots"></dots>
            <app-header ref="header"></app-header>
            <transition name="faderouterfront" mode="out-in">
                <router-view :key="$route.path" class="app-content"></router-view>
            </transition>
            <app-footer ref="footer"></app-footer>
        </div>
        @include('scripts')
        {{-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBc8scgyz9ttj1Fs8_tHl9UYA7jRnte_Cw" async defer></script> --}}

    </body>
</html>
