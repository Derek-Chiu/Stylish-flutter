package com.example.stylish

import android.content.BroadcastReceiver
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val TAG = "MainActivity"
    private val BATTERY_CHANNEL = "samples.flutter.io/battery"
    private val CHARGING_CHANNEL = "samples.flutter.io/charging"
    private val TAPPAY_CHANNEL = "test_tappay"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        EventChannel(flutterEngine.dartExecutor, CHARGING_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                private var chargingStateChangeReceiver: BroadcastReceiver? = null
                override fun onListen(arguments: Any?, events: EventSink) {
                    chargingStateChangeReceiver = createChargingStateChangeReceiver(events)
                    registerReceiver(
                        chargingStateChangeReceiver, IntentFilter(Intent.ACTION_BATTERY_CHANGED)
                    )
                }
                override fun onCancel(arguments: Any?) {
                    unregisterReceiver(chargingStateChangeReceiver)
                    chargingStateChangeReceiver = null
                }
            }
        )

        MethodChannel(flutterEngine.dartExecutor, BATTERY_CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getBatteryLevel") {
                val batteryLevel = getBatteryLevel()
                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, TAPPAY_CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "tappay") {
                    Log.d(TAG, "i got u ^.<")
                    val dialog = PrimeDialog(context, object : PrimeDialog.PrimeDialogListener {
                        override fun onSuccess(prime: String) {
                            Log.d(TAG, "onSuccess, prime=$prime")
                            result.success(prime)
                        }
                        override fun onFailure(error: String) {
                            Log.d(TAG, "onFailure, error=$error")
                            result.success(error)
                        }
                    })
                    dialog.show()
                } else {
                    Log.d(TAG, "u know nothing ${call.method}")
                    result.error("404", "404", null)
                }
//                result.error("404", "404", null)
            }
    }

    private fun createChargingStateChangeReceiver(events: EventSink): BroadcastReceiver? {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                val status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1)
                if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
                    events.error("UNAVAILABLE", "Charging status unavailable", null)
                } else {
                    val isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING ||
                            status == BatteryManager.BATTERY_STATUS_FULL
                    events.success(if (isCharging) "charging" else "discharging")
                }
            }
        }
    }

    private fun getBatteryLevel(): Int {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(
                null, IntentFilter(
                    Intent.ACTION_BATTERY_CHANGED
                )
            )
            intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(
                BatteryManager.EXTRA_SCALE,
                -1
            )
        }
    }
}
