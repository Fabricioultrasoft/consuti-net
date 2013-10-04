    // ============================================================= 
    // script written by Gerard Ferrandez - September, 2009 
    // http://www.dhteumeuleu.com 
    // use under CC-BY-NC license 
    // ============================================================= 


    var tm = function () {
        /* ---- private vars ---- */
        var O = [];
        var xm = 0;
        var ym = 0;
        var scr, txe, tye, txi, tyi, nw, nh;
        var axi = 0;
        var ayi = 0;
        var axe = 0;
        var aye = 0;
        var npart = 200;
        //////////////////////////////////////////////////////////////////////////// 
        /* --- events --- */
        var addEvent = function (o, e, f) {
            if (window.addEventListener) o.addEventListener(e, f, false);
            else if (window.attachEvent) r = o.attachEvent('on' + e, f);
        }
        /* --- resize --- */
        var resize = function () {
            nw = scr.offsetWidth * .5;
            nh = scr.offsetHeight * .5;
        }
        //////////////////////////////////////////////////////////////////////////// 
        /* --- init script --- */
        var init = function () {
            for (var i = 0; i < npart; i++) {
                o = {};
                /* ==== plot ==== */
                o.plo = document.createElement('div');
                o.plo.className = 'plo out';
                scr.appendChild(o.plo);
                /* ==== 3D coordinates (thx to Vincent Borrel - vinouz) ==== */
                var r = 1 * i / npart;
                var j, a, b;
                j = i % (npart * .5);
                a = Math.floor(j) / 200 + (Math.floor(j / 2) % 10) / 5 * Math.PI * 2;
                b = Math.acos(-0.9 + (j % 4) * 0.6);
                if (i < npart * .5) {
                    r = .05 + r * 0.2;
                    o.s = true;
                } else {
                    r = .8;
                    o.s = false;
                }
                var sbr = Math.sin(b) * r;
                o.x = Math.sin(a) * sbr;
                o.y = Math.cos(a) * sbr;
                o.z = Math.cos(b) * r;
                /* ==== push object ==== */
                O.push(o);
                /* ==== 3D transform function ==== */
                o.transform = function () {
                    var ax = .02 * (this.s ? txi : txe);
                    var ay = .02 * (this.s ? tyi : tye);
                    var cx = Math.cos(ax);
                    var sx = Math.sin(ax);
                    var cy = Math.cos(ay);
                    var sy = Math.sin(ay);
                    /* ==== Rotation ==== */
                    var z = this.y * sx + this.z * cx;
                    this.y = this.y * cx + this.z * -sx;
                    this.z = this.x * -sy + z * cy;
                    this.x = this.x * cy + z * sy;
                    /* ==== 3D to 2D ==== */
                    var scale = 1 / (1 + this.z);
                    var x = this.x * scale * nh + nw - scale * 2;
                    var y = this.y * scale * nh + nh - scale * 2;
                    /* ==== plot ==== */
                    var p = this.plo.style;
                    if (x >= 0 && y >= 0 && x < nw * 2 && y < nh * 2) {
                        var c = Math.round(256 + (-this.z * 256));
                        p.left = Math.round(x) + 'px';
                        p.top = Math.round(y) + 'px';
                        p.width = 2 + 'px';
                        p.height = 2 + 'px';
                        p.background = this.s ? 'rgb('.concat(((c * 3) - 512), ',', ((c * 3) - 620), ',', (c * .25), ')') : 'rgb('.concat((c), ',', (c), ',', (1024 - c), ')');
                        p.zIndex = 200 + Math.floor(-this.z * 100);
                    } else p.width = "0px";
                }
            }
        }
        //////////////////////////////////////////////////////////////////////////// 
        /* --- main loop --- */
        var run = function () {
            /* ---- mouse ---- */
            var si = 10 / nh;
            var se = 2 / nh;
            txi = (ym - axi) * si;
            tyi = (xm - ayi) * si;
            txe = (ym - axe) * se;
            tye = (xm - aye) * se;
            axi += txi;
            ayi += tyi;
            axe += txe;
            aye += tye;
            /* ---- anim particles ---- */
            for (var i = 0, o; o = O[i]; i++)
                o.transform();
        }
        return {
            //////////////////////////////////////////////////////////////////////////// 
            /* ==== public functions ==== */
            init: function () {
                /* ---- init script ---- */
                scr = document.getElementById('screen');
                addEvent(document, 'mousemove', function (e) {
                    if (window.event) e = window.event;
                    xm = e.clientX;
                    ym = e.clientY;
                });
                resize();
                addEvent(window, 'resize', resize);
                init();
                resize();
                setInterval(run, 16);
            }
        }
    } ();

    /* ==== start script ==== */
    onload = function () {
        tm.init();
    }