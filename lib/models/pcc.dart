part of 'models.dart';

class PccModel extends Equatable {
  PccModel({
    this.id,
    this.idKategoriEvent,
    this.noSurat,
    this.namaEvent,
    this.tanggal,
    this.tempat,
    this.anggaran,
    this.kuota,
    this.status,
    this.gambar,
    this.urlLiveId,
    this.tokenPeserta,
    this.tokenModerator,
    this.tokenPresenter,
    this.tokenHost,
    this.eventDesc,
    this.eventSlug,
    this.eventPassword,
    this.eventPublikasi,
    this.eventJenis,
    this.linkStreaming,
  });

  final int id;
  final int idKategoriEvent;
  final String noSurat;
  final String namaEvent;
  final DateTime tanggal;
  final String tempat;
  final int anggaran;
  final int kuota;
  final int status;
  final String gambar;
  final String urlLiveId;
  final String tokenPeserta;
  final String tokenModerator;
  final String tokenPresenter;
  final String tokenHost;
  final String eventDesc;
  final String eventSlug;
  final String eventPassword;
  final int eventPublikasi;
  final int eventJenis;
  final String linkStreaming;

  factory PccModel.fromJson(data) => PccModel(
        id: data['id'],
        idKategoriEvent: data['id_Kategori_event'],
        noSurat: data['no_surat'],
        namaEvent: data['nama_event'],
        tanggal: DateTime.parse(data["tanggal"]),
        tempat: data['tempat'],
        anggaran: data['anggaran'],
        kuota: data['kuota'],
        status: data['status'],
        gambar: data['gambar'],
        urlLiveId: data['url_live_id'],
        tokenPeserta: data['token_peserta'],
        tokenModerator: data['token_moderator'],
        tokenPresenter: data['token_presenter'],
        tokenHost: data['token_host'],
        eventDesc: data['event_desc'],
        eventSlug: data['event_slug'],
        eventPassword: data['event_password'],
        eventPublikasi: data['event_publikasi'],
        eventJenis: data['event_jenis'],
        linkStreaming: data['link_streaming'],
      );
  @override
  List<Object> get props => [
        id,
        idKategoriEvent,
        noSurat,
        namaEvent,
        tanggal,
        tempat,
        anggaran,
        kuota,
        status,
        gambar,
        urlLiveId,
        tokenPeserta,
        tokenModerator,
        tokenPresenter,
        tokenHost,
        eventDesc,
        eventSlug,
        eventPassword,
        eventPublikasi,
        eventJenis,
        linkStreaming,
      ];
}
